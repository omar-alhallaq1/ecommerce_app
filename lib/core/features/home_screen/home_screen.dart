import 'package:ecommerce_app/core/features/home_screen/cubit/categories_cubit.dart';
import 'package:ecommerce_app/core/features/home_screen/cubit/categories_state.dart';
import 'package:ecommerce_app/core/features/home_screen/cubit/product_cubit.dart';
import 'package:ecommerce_app/core/features/home_screen/cubit/product_state.dart';
import 'package:ecommerce_app/core/features/home_screen/model/products_model.dart';
import 'package:ecommerce_app/core/features/home_screen/widgets/category_item_widget.dart';
import 'package:ecommerce_app/core/features/home_screen/widgets/prodect_item_widget.dart';
import 'package:ecommerce_app/core/styling/app_assets.dart';
import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/wedgets/custom_text_field.dart';
import 'package:ecommerce_app/core/wedgets/loding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    context.read<ProductCubit>().featchProducts();
    context.read<CategoriesCubit>().fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
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
              Expanded(child: CustomTextField(hintText: "Search for Clothes")),

              Gap(8.w),

              Container(
                width: 52.w,
                height: 52.h,
                decoration: BoxDecoration(
                  color: AppColors.primarycolor,
                  borderRadius: BorderRadius.circular(8.r),
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
                return SizedBox(
                  height: 40.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.categories.length,
                    separatorBuilder: (context, index) => Gap(8.w),
                    itemBuilder: (context, index) {
                      return CategoryItemWidget(
                        categoryName: state.categories[index],
                      );
                    },
                  ),
                );
              }

              return const SizedBox.shrink();
            },
          ),

          Gap(16.h),

          Expanded(
            child: BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return LodingWidget();
                }

                if (state is ProductLoaded) {
                  List<ProductModel> products = state.products;

                  return GridView.builder(
                    itemCount: products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.w,
                      mainAxisSpacing: 8.h,
                      childAspectRatio: 0.68,
                    ),
                    itemBuilder: (context, index) {
                      final product = products[index];

                      return ProdectItemWidget(
                        image: product.image ?? "",
                        title: product.title ?? "",
                        price: product.price?.toString() ?? "",
                        onTap: () {},
                      );
                    },
                  );
                }

                if (state is ProductError) {
                  return Center(child: Text(state.massage));
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
