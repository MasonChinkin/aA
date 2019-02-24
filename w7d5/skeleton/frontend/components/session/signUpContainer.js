import {
  connect
} from 'react-redux';
import {
  createUser
} from "../../actions/session";
import SignUp from "./signUp";

const mapdispatchToProps = dispatch => ({
  createUser: formUser => dispatch(createUser(formUser))
})

export default connect(null, mapdispatchToProps)(SignUp)