import {
  postUser,
  deleteSession,
  postSession
} from "../utils/session";

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER'
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER'

const receiveCurrentUser = user => ({
  type: RECEIVE_CURRENT_USER,
  user
})

const logoutCurrentUser = () => ({
  type: LOGOUT_CURRENT_USER,
})

export const createNewUser = formUser => dispatch => {
  return postUser(formUser).then(user => dispatch(receiveCurrentUser(user)));
}

export const logIn = formUser => dispatch => {
  return postSession(formUser).then(user => dispatch(receiveCurrentUser(user)))
}

export const logOut = () => dispatch => {
  return deleteSession().then(user => dispatch(logoutCurrentUser(user)))
}