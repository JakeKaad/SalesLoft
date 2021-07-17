import React, { useState } from 'react'
import styled from 'styled-components'
import axios from 'axios'
import PeopleTable from './PeopleTable'
import Letters from './Letters'

const Button = styled.button`
  background-color: #4caf50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
`

const fetchPeople = (setPeople) =>
  axios.get('api/people').then((response) => setPeople(response.data))

const renderPeopleSwitch = (param, { people }) => {
  switch (param) {
    case 'LetterCounter':
      return <Letters people={people} />
    default:
      return <PeopleTable people={people} />
  }
}

const People = () => {
  const [people, setPeople] = useState(null)
  const [pageSwitch, setPageSwitch] = useState('People')

  people || fetchPeople(setPeople)

  return (
    <div>
      <div>
        <Button onClick={() => setPageSwitch('People')}>People </Button>
        <Button onClick={() => setPageSwitch('LetterCounter')}>Letters </Button>
      </div>
      <div>{renderPeopleSwitch(pageSwitch, { people })}</div>
    </div>
  )
}

export default People
