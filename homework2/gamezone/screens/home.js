/* Created by: kvlinden
 * Edited by: Esther Cha
 * Date: 10/15/2020
 * homework2
 */

import React, { useEffect, useState } from 'react';
import { StyleSheet, View, Text, TouchableOpacity, FlatList, ActivityIndicator } from 'react-native';
import { globalStyles } from '../styles/global';
import Card from '../shared/card';

export default function Home({ navigation }) {
    const [isLoading, setLoading] = useState(true);
    const [data, setData] = useState([]);
  
    useEffect(() => {
      fetch('https://cs262-monopoly-service.herokuapp.com/players/')
          .then((response) => response.json())
          .then((json) => setData(json))
          .catch((error) => console.error(error))
          .finally(() => setLoading(false));
    }, []);

    return (
        <View style={globalStyles.container}>
            {isLoading ? <ActivityIndicator/> : (
            <FlatList data={data} 
            keyExtractor={({ id }, index) => id.toString()}
            renderItem={({ item }) => (
                <TouchableOpacity onPress={() => navigation.navigate('ReviewDetails', item)}>
                    <Card>
                        <Text style={globalStyles.titleText}>{ item.email }</Text>
                    </Card>
                </TouchableOpacity>
                )} 
            />
            )} 
        </View>
    );
};
