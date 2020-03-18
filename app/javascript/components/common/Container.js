    import React from 'react';
    import CssBaseline from '@material-ui/core/CssBaseline/index';
    import Container from '@material-ui/core/Container/index';

    const styles = {
        container: {
            width: '100%',
            padding: 10,
            marginTop: 10
        },
    }

    export default function SimpleContainer(props) {
        return (
            <React.Fragment>
                <CssBaseline />
                <Container style={styles.container}>
                    {props.children}
                </Container>
            </React.Fragment>
        );
    }