import React from 'react'
import styled from 'styled-components'
import { Table, THead, HeaderCell, TableCell } from './TableStyles'

const PeopleTable = ({ people }) => (
  <Table>
    <THead>
      <tr>
        <HeaderCell> Name </HeaderCell>
        <HeaderCell> Email </HeaderCell>
        <HeaderCell> Job Title </HeaderCell>
      </tr>
    </THead>
    <tbody>
      {people
        ? people.map((user, i) => (
            <tr key={i}>
              <TableCell> {user.name} </TableCell>
              <TableCell> {user.email} </TableCell>
              <TableCell> {user.job_title} </TableCell>
            </tr>
          ))
        : null}
    </tbody>
  </Table>
)

export default PeopleTable
