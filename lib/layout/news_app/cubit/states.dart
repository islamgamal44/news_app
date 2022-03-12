abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessLoadingState extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates
{
  late final String error ;
  NewsGetBusinessErrorState(this.error);
}

class NewsGetSportsSuccessState extends NewsStates {}

class NewsGetSportsLoadingState extends NewsStates {}

class NewsGetSportsErrorState extends NewsStates
{
  late final String error ;
  NewsGetSportsErrorState(this.error);
}

class NewsGetScienceSuccessState extends NewsStates {}

class NewsGetScienceLoadingState extends NewsStates {}

class NewsGetScienceErrorState extends NewsStates
{
  late final String error ;
  NewsGetScienceErrorState(this.error);
}

class NewsGetSearchSuccessState extends NewsStates {}

class NewsGetSearchLoadingState extends NewsStates {}

class NewsGetSearchErrorState extends NewsStates
{
  late final String error ;
  NewsGetSearchErrorState(this.error);
}

