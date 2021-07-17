import React, { useState } from 'react'
import styled from 'styled-components'
import axios from 'axios'
import PeopleTable from './PeopleTable'

const fetchPeople = (setPeople) =>
  axios.get('api/people').then((response) => setPeople(response.data))

const People = () => {
  const [people, setPeople] = useState(null)
  const [pageSwitch, setPageSwitch] = useState('People')

  people || fetchPeople(setPeople)

  return
  ;<>
    <button onClick={setPageSwitch('People')}>People </button>
    <PeopleTable people={people} />
  </>
}

export default People
