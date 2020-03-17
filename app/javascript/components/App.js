import React, { useEffect } from 'react'
import PropTypes from 'prop-types'
import { Redirect } from "react-router"

const App = props => {

    useEffect(() => {
        console.log(props)
    }, []);

    const logout = () => {
        fetch('/users/sign_out', {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json',
                'X_CSRF_Token': props.csrf
            }
        }).then(()=> {window.location = "/signed_out"})
    }

    return(
        <div style={{width:500, margin: "auto"}}>
            <a style={{cursor: 'pointer'}} onClick={logout} >logout</a>
            <h3>Hello {props.user.email}!</h3>
            <p>
                {JSON.stringify(props.user)}
            </p>
        </div>
    )
}

App.defaultProps = {
    name: 'David'
}

App.propTypes = {
    name: PropTypes.string
}

export default App;