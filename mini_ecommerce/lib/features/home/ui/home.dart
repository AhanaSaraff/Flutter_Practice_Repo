import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/features/cart/ui/cart.dart';
import 'package:mini_ecommerce/features/home/bloc/home_bloc.dart';
import 'package:mini_ecommerce/features/wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current)=>current is !HomeActionState,
      listener: (context, state) {
        if(state is HomeNavigateToCartPageActionState){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return Cart();
          }));
        }
        else if(state is HomeNavigateToWishListPageActionState){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return Wishlist();
          }));
        }

      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text('Mini Ecommerce App'),
              actions: [
                IconButton(onPressed: (){
                  homeBloc.add(HomeWishlistButtonNavigateEvent());
                }, icon: Icon(Icons.favorite),),
                IconButton(onPressed: (){
                  homeBloc.add(HomeCartButtonNavigateEvent());
                }, icon: Icon(Icons.shopping_bag),),

              ],
            )
        );
      },
    );
  }
}
