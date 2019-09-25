console.log('Hello Webpack !');

import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import $ from "jquery";

class Lobby extends Component {
  constructor(props) {
    super(props);

    this.state = {
      responseData: {},
      isLoading: false
    }
  }

  componentDidMount() {
    this.setState({isLoading: true}, () => {
      $.ajax({
        url: `http://localhost:3000/api/hello`,
        type: "GET",
        contentType: "application/json",
        dataType: "json",
        crossDomain: false,
        success: function(responseData) {
          console.log(responseData);
          this.setState({
            responseData: responseData,
            isLoading: false
          });
        }.bind(this),
        error: function(_xhr, _status, _err) {
          this.setState({ isLoading: false });
        }.bind(this)
      });
    })
  }

  render() {
    let { responseData } = this.state;
    console.log(responseData);

    return (
      <h1>{responseData.message}</h1>
    )
  }
}

const yieldNode = document.querySelector('#yield');
ReactDOM.render(
  <Lobby />,
  yieldNode
);