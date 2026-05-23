import 'package:ecommerce_app/core/features/home_screen/cubit/categories_cubit.dart';
import 'package:ecommerce_app/core/features/home_screen/cubit/categories_state.dart';
import 'package:ecommerce_app/core/features/home_screen/cubit/product_cubit.dart';
import 'package:ecommerce_app/core/features/home_screen/cubit/product_state.dart';
import 'package:ecommerce_app/core/features/home_screen/model/products_model.dart';
import 'package:ecommerce_app/core/features/home_screen/widgets/category_item_widget.dart';
import 'package:ecommerce_app/core/features/home_screen/widgets/prodect_item_widget.dart';
import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/core/styling/app_assets.dart';
import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/wedgets/custom_text_field.dart';
import 'package:ecommerce_app/core/wedgets/loding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCat = "All";
  @override
  void initState() {
    context.read<ProductCubit>().featchProducts();
    context.read<CategoriesCubit>().fetchCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24).w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(59.h),
          SizedBox(
            width: 128.w,
            child: Text("Discover", style: AppStyles.primaryheadlinestyle),
          ),
          Gap(16.h),
          Row(
            children: [
              CustomTextField(width: 281.w, hintText: "Search for Clothes"),
              Gap(8.w),
              Container(
                width: 52.w,
                height: 52.h,
                decoration: BoxDecoration(
                  color: AppColors.primarycolor,
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppAssets.filterSvg,
                    width: 24.w,
                    height: 24.h,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Gap(16.h),
          BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              if (state is CategoriesLoaded) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: state.categories.map((cat) {
                      return CategoryItemWidget(
                        categoryName: cat,
                        isSelected: selectedCat == cat ? true : false,
                        onTap: () {
                          setState(() {
                            selectedCat = cat;
                            if (cat == "All") {
                              context.read<ProductCubit>().featchProducts();
                            } else {
                              context
                                  .read<ProductCubit>()
                                  .featchProductsCategory(cat);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                );
              }
              return SizedBox.shrink();
            },
          ),
          Gap(16.h),
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return LodingWidget(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                );
              }
              if (state is ProductLoaded) {
                List<ProductModel> products = state.products;
                return Expanded(
                  child: RefreshIndicator(
                    color: AppColors.primarycolor,
                    backgroundColor: Colors.white,
                    onRefresh: () async {
                      selectedCat = "All";
                      setState(() {});
                      context.read<ProductCubit>().featchProducts();
                    },
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.w,
                        mainAxisSpacing: 8.h,
                        childAspectRatio: 0.9,
                      ),
                      children: products.map((product) {
                        return ProdectItemWidget(
                          image: product.image ?? "",
                          title: product.title ?? "",
                          price: product.price?.toString() ?? "",
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              AppRoutes.productdetailsScreen,
                              extra: product,
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                );
              }
              return Text("this is error");
            },
          ),
        ],
      ),
    );
  }
}
