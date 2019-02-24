import {
  combineReducers
} from 'redux';
import entitiesReducer from './entities';
import {
  sessionRecucer
} from './session';

export default combineReducers({
  entities: entitiesReducer,
  session: sessionRecucer
});