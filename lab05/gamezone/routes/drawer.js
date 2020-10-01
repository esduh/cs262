import * as React from 'react';
import { Button, View } from 'react-native';
import { createDrawerNavigator } from '@react-navigation/drawer';
import { NavigationContainer } from '@react-navigation/native';

import Home from '../routes/homeStack';
import About from '../routes/aboutStack';
import HomeStack from '../routes/homeStack';
import AboutStack from '../routes/aboutStack';

const Drawer = createDrawerNavigator();

export default function App() {
    return (
        <Drawer.Navigator initialRouteName="Home">
            <Drawer.Screen name="Home" component={Home} />
            <Drawer.Screen name="About" component={About} />
        </Drawer.Navigator>
    );
};