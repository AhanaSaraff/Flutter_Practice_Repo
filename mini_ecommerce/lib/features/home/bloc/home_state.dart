part of 'home_bloc.dart';

@immutable
sealed class HomeState {}
abstract class HomeActionState extends HomeState{}

final class HomeInitial extends HomeState {}
final class HomeLoadingState extends HomeState{}
final class HomeLoadedSuccessState extends HomeState{
  final List<ProductDataModel> products;
  HomeLoadedSuccessState({required this.products});

}

final class HomeNavigateToWishlistPageActionState extends HomeActionState{}
final class HomeNavigateToCartPageActionState extends HomeActionState{}
