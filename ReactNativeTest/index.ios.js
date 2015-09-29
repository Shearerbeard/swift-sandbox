/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';

var React = require('react-native');
var {Map} = require('immutable');

var {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  MapView
} = React;

var ReactNativeTest = React.createClass({
  watchId: null,
  regionDeltas: {
    latitudeDelta: 0.001,
    longitudeDelta: 0.001
  },
  getInitialState: () => ({initial:
    {latitude: 0, longitude: 0}}),
  componentDidMount() {
    navigator.geolocation.getCurrentPosition(
        (initial) => this.setState({initial}),
        (error) => alert(error.message),
        {enableHighAccuracy: true, timeout: 20000, maximumAge: 1000});
    this.watchId = navigator.geolocation.watchPosition(initial => {
      this.setState({initial: initial.coords});
    })
  },
  componentWillUnmount() {
    navigator.geolocation.clearWatch(this.watchId);
  },
  render: function() {
    let {latitude, longitude} = this.state.initial;
    let region = Object.assign({latitude, longitude}, this.regionDeltas);
    let annotations = [{latitude, longitude}];
    return (
      <View style={styles.container}>
        <View style={styles.textBox}>
          <Text style={styles.text}>Test</Text>
        </View>
        <MapView style={styles.map}
                 region={region}
                 showsUserLocation={true}
                 annotations={annotations}>
        </MapView>
      </View>
    );
  }
});

var styles = StyleSheet.create({
  map: {
    flex: 1,
    flexDirection: "row",
    justifyContent: 'center',
    alignItems: 'center',
    margin: 10,
    borderWidth: 1,
    borderColor: '#000000'
  },
  textBox: {
    height: 100,
    marginTop: 60,
    lineHeight: 10.0,
    textAlign: "center",
    alignItems: "center",
    justifyContent: "center"
  },
  container: {
    flex: 1,
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('ReactNativeTest', () => ReactNativeTest);
