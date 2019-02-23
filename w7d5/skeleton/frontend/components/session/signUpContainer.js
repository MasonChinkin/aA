import {
  connect
} from 'react-redux';
import {
  createNewUser
} from '../../actions/session';
import SignUp from './signUp';

const mapDispatchToProps = dispatch => ({
  createNewUser: formUser => dispatch(createNewUser(formUser))
})

export default connect(null, mapDispatchToProps)(SignUp)