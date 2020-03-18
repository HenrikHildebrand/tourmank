import React, { useEffect } from 'react'
import PropTypes from 'prop-types'
import Swiper from './Swiper'
import Slide from '@material-ui/core/Slide';
import Container from './common/Container';

const styles = {
    logout: {
        color: 'white'
    }
}

class App extends React.Component {

    state = {
        loaded: false
    }

    componentDidMount() {
        this.setState({
            loaded: true,
            csrf: this.props.csrf
        })
    }

    logout = () => {
        fetch('/users/sign_out', {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json',
                'X_CSRF_Token': this.state.csrf
            }
        }).then(()=> {
            this.setState({loaded: false});
            window.location = "/signed_out"
        })
    }

    render(){
        return(
            <Slide direction="up" in={this.state.loaded} >
                <Swiper>
                    <Container  label="Matcher" style={styles.container}>
                        <a className="btn btn-danger" style={styles.logout} onClick={this.logout} >logout</a>
                        <h3>Hello {this.props.user.email}!</h3>
                        <p>{JSON.stringify(this.props.user)}</p>
                    </Container>
                    <Container  label="Slutspel" style={styles.container}>
                        <h3>Other content</h3>
                    </Container>
                </Swiper>
            </Slide>
        )
    }
}

App.defaultProps = {
    name: 'Henrik'
}

App.propTypes = {
    name: PropTypes.string
}

export default App;