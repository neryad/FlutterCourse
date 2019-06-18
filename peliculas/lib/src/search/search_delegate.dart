import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/provider/peliculas_provider.dart';


class DataSearch extends SearchDelegate{
String seleccion = '';
final peliculaProvider = new PeliculasProvider();
  // final peliculas = [
  //  'Spiderman',
  //  'Aquman',
  //  'Batman',
  //  'Shazam',
  //  'Superman',
  //  'Ironman 1',
  //  'Ironman 2',
  //  'Ironman 3',
  //  'Ironman 4',
  //  'Ironman 5',
 
  // ];
  // final peliculasRciene = [
  //   'Spiderman',
  //   'Capitan Marvel'
  // ];



  @override
  List<Widget> buildActions(BuildContext context) {
    // Las acciones de nuetro appBar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query= '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del appBar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context , null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados a mostrar
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blueAccent,
        child: Text(seleccion),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Las sugrencias que aparecen cunado la peronsa escribe
   
    if( query.isEmpty){
      return Container();
    }
    return FutureBuilder(
      future: peliculaProvider.buscarPelicua(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if(snapshot.hasData){
          final pelicula  = snapshot.data;
          return ListView(
            children: pelicula.map((pelicula){ 
              return ListTile(
                leading: FadeInImage(
                  image: NetworkImage(pelicula.getPosterImg()),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  width: 50.0,
                  fit: BoxFit.contain,
                ),
                title: Text(pelicula.title),
                subtitle: Text(pelicula.originalTitle),
                onTap: (){
                  close(context,null);
                  pelicula.uniqueId = '';
                  Navigator.pushNamed(context, 'detalle',arguments: pelicula);
                },

              );
            }).toList()
          );

        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }


  // Widget buildSuggestions(BuildContext context) {
  //   // Las sugrencias que aparecen cunado la peronsa escribe
  //   final listaSugerida = ( query.isEmpty) ? peliculasRciene:peliculas.where((p)=>p.toLowerCase().startsWith(query.toLowerCase())).toList();

  //   return ListView.builder(
  //     itemCount: listaSugerida.length,
  //     itemBuilder: (context,i){
  //       return ListTile(
  //         leading: Icon(Icons.movie),
  //         title: Text(listaSugerida[i]),
  //         onTap: (){
  //           seleccion = listaSugerida[i];
  //           showResults(context);
  //         },
  //       );
  //     },
  //   );
  // }

}

