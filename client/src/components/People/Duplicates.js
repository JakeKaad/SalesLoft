import React from 'react'
import { Table, THead, HeaderCell, TableCell } from './TableStyles'

const Duplicates = ({ people }) => (
  <Table>
    <THead>
      <tr>
        <HeaderCell> Name </HeaderCell>
        <HeaderCell> Possible Duplicates </HeaderCell>
      </tr>
    </THead>
    <tbody>
      {people
        ? people.map(({ email, possibleDuplicates }, i) => (
            <tr key={i}>
              <TableCell>{email}</TableCell>
              <TableCell>{possibleDuplicates.join(', ')}</TableCell>
            </tr>
          ))
        : null}
    </tbody>
  </Table>
)

export default Duplicates
