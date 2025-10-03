import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/features/cart/ui/cart.dart';
import 'package:mini_ecommerce/features/home/bloc/home_bloc.dart';
import 'package:mini_ecommerce/features/home/ui/product_tile_widget.dart';
import 'package:mini_ecommerce/features/wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {
  final homeBloc = HomeBloc();
  
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen:(previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is !HomeActionState,
      listener: (context, state) {
        if(state is HomeNavigateToCartPageActionState){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Cart() ));
        }else if (state is HomeNavigateToWishlistPageActionState){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Wishlist() ));
        }
      },
      builder: (context, state) {
        switch(state.runtimeType){
          case HomeLoadingState:
            return Scaffold(body: Center(
              child: CircularProgressIndicator(),),);
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                title: Text('Mini E-Commerce App'),
                actions: [
                  IconButton(onPressed: (){
                    homeBloc.add(HomeWishlistButtonNavigateEvent());
                  }, icon: Icon(Icons.favorite)),
                  IconButton(onPressed: (){
                    homeBloc.add(HomeCartButtonNavigateEvent());
                  }, icon: Icon(Icons.shopping_bag))
                ],
              ),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index){
                return ProductTileWidget(productDataModel: successState.products[index]);
              }),

            );
          case HomeErrorState:
            return Scaffold(
              body: Center(child: Text("Error"),)
            );
          default:
            return SizedBox();

        }

      },
    );
  }

}


