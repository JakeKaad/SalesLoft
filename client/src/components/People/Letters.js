import React from 'react'
import styled from 'styled-components'
import { letterCounter } from '../../utils'
import { Table, THead, HeaderCell, TableCell } from './TableStyles'

const Letters = ({ people }) => {
  const emails = people.map((person) => person.email)
  const letterCountObject = letterCounter(emails)

  return (
    <Table>
      <THead>
        <tr>
          <HeaderCell> Letter </HeaderCell>
          <HeaderCell> Frequency </HeaderCell>
        </tr>
      </THead>
      <tbody>
        {people
          ? Object.keys(letterCountObject).map((key, i) => (
              <tr key={i}>
                <TableCell> {key} </TableCell>
                <TableCell> {letterCountObject[key]} </TableCell>
              </tr>
            ))
          : null}
      </tbody>
    </Table>
  )
}

export default Letters
