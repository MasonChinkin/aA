import {
  postUser,
  postSession,
  deleteSession
} from "../utils/session";

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER'
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER'

export const receiveCurrentUser = user => ({
  type: RECEIVE_CURRENT_USER,
  user
})

export const logoutCurrentUser = () => ({
  type: LOGOUT_CURRENT_USER
})

export const createUser = formUser => dispatch => {
  return postUser(formUser).then(dispatch(receiveCurrentUser(formUser)))
}

export const loginUser = formUser => dispatch => {
  return postSession(formUser).then(dispatch(receiveCurrentUser(formUser)))
}

export const logout = () => dispatch => {
  return deleteSession().then(() => dispatch(logoutCurrentUser()))
}