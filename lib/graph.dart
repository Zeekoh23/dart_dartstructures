/*class Graph<T>{
  int numberOfNodes = 0;
  Map adjacentList = {};

  addVertex(T node){
    adjacentList[node] = [];
    numberOfNodes++;
  }
  addEdge(T node1, T node2){
    adjacentList[node1].add(node2);
    adjacentList[node2].add(node1);
  }
  showConnections(){
    var allNodes = Map.from(adjacentList);
    for(var node in allNodes){

    }
  }

 
}*/

class Vertex<T> {
  final int index;
  final T data;

  Vertex({required this.index, required this.data});

  @override
  String toString() => data.toString();
}

class Edge<T> {
  final Vertex<T> source;
  final Vertex<T> destination;
  final double? weight;

  Edge(this.source, this.destination, [this.weight]);
}

enum EdgeType { directed, undirected }

abstract class Graph<E> {
  Iterable<Vertex<E>> get vertices;

  Vertex<E> createVertex(E data);

  void addEdge(Vertex<E> source, Vertex<E> destination,
      {EdgeType edgeType, double? weight});

  List<Edge<E>> edges(Vertex<E> source);

  double? weight(Vertex<E> source, Vertex<E> destination);
}

//adjacency list is a type of graph, it implements graph
class AdjacencyList<E> implements Graph<E> {
  final Map<Vertex<E>, List<Edge<E>>> _connections = {};
  var _nextIndex = 0;

  @override
  Iterable<Vertex<E>> get vertices => _connections.keys;

  @override
  Vertex<E> createVertex(E data) {
    final vertex = Vertex(index: _nextIndex, data: data);
    _nextIndex++;
    _connections[vertex] = [];
    return vertex;
  }

  //to connect 2 vertices you need to add an edge
  @override
  void addEdge(Vertex<E> source, Vertex<E> destination,
      {EdgeType edgeType = EdgeType.undirected, double? weight}) {
    _connections[source]?.add(Edge(source, destination, weight));

    if (edgeType == EdgeType.undirected) {
      _connections[destination]?.add(Edge(destination, source, weight));
    }
  }

  @override
  List<Edge<E>> edges(Vertex<E> source) {
    return _connections[source] ?? [];
  }

  //weight is the cost of going from one vertex to another
  @override
  double? weight(Vertex<E> source, Vertex<E> destination) {
    final match = edges(source).where((edge) {
      return edge.destination == destination;
    });
    if (match.isEmpty) return null;
    return match.first.weight;
  }

  //print the adjacency list
  @override
  String toString() {
    final result = StringBuffer();
    _connections.forEach((vertex, edges) {
      final destinations = edges.map((edge) {
        return edge.destination;
      }).join(', ');
      result.writeln('$vertex --> $destinations');
    });
    return result.toString();
  }
}

void main() {
  final graph = AdjacencyList<String>();
  final singapore = graph.createVertex('Singapore');
  final tokyo = graph.createVertex('Tokyo');
  final hongKong = graph.createVertex('Hong Kong');
  final detroit = graph.createVertex('Detroit');
  final sanFrancisco = graph.createVertex('San Francisco');
  final washingtonDC = graph.createVertex('Washington DC');
  final austinTexas = graph.createVertex('Austin Texas');
  final seattle = graph.createVertex('Seattle');

  graph.addEdge(singapore, hongKong, weight: 300);
  graph.addEdge(singapore, tokyo, weight: 500);
  graph.addEdge(hongKong, tokyo, weight: 250);
  graph.addEdge(tokyo, detroit, weight: 450);
  graph.addEdge(tokyo, washingtonDC, weight: 300);
  graph.addEdge(hongKong, sanFrancisco, weight: 600);
  graph.addEdge(detroit, austinTexas, weight: 50);
  graph.addEdge(austinTexas, washingtonDC, weight: 292);
  graph.addEdge(sanFrancisco, washingtonDC, weight: 337);
  graph.addEdge(washingtonDC, seattle, weight: 277);
  graph.addEdge(sanFrancisco, seattle, weight: 218);
  graph.addEdge(austinTexas, sanFrancisco, weight: 297);

  print(graph);
}
