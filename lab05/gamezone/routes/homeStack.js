import React from 'react';
import {createStackNavigator} from '@react-navigation/stack';

import Header from '../shared/header';
import Home from '../screens/home';
import ReviewDetails from '../screens/reviewDetails';
import { NavigationContainer } from '@react-navigation/native';

const screens = {
    Home: {
        screen: Home,
        navigationOptions: ({navigation}) => {
            return {
            headerTitle: () => <Header navigation={navigation} title='GameZone'/>,
            }
        }
    },
    ReviewDetails: {
        screen: ReviewDetails,
        navigationOptions: {
            title: 'Review Details',
        }
    }
}

const Stack = createStackNavigator();
export default function HomeStack( {navigation} ) {
    return (
        <Stack.Navigator screenOptions={{
            headerStyle:{backgroundColor:'#ddd'}
        }}>
            <Stack.Screen
                name="GameZone"
                component={Home}
                options={{
                    headerLeft: () =>  <Header navigation={navigation} />
                }}
            />
            <Stack.Screen
                name="ReviewDetails"
                component={ReviewDetails}
                options={{title: 'Review Details'}}
            />
        </Stack.Navigator>
    );
};
