import React from 'react'
import styled from 'styled-components'

const Table = styled.table`
  color: #333;
  background: white;
  border: 1px solid grey;
  font-size: 12pt;
  border-collapse: collapse;
`

const THead = styled.thead`
  color: #777;
  background: rgba(0, 0, 0, 0.1);
`

const HeaderCell = styled.th`
  padding: 0.5em;
  border: 1px solid lightgrey;
`

const TableCell = styled.td`
  padding: 0.5em;
  border: 1px solid lightgrey;
`

const UsersTable = ({ users }) => (
  <Table>
    <THead>
      <HeaderCell> Name </HeaderCell>
      <HeaderCell> Email </HeaderCell>
      <HeaderCell> Job Title </HeaderCell>
    </THead>

    {users
      ? users.map((user, i) => (
          <tr>
            <TableCell> {user.name} </TableCell>
            <TableCell> {user.email} </TableCell>
            <TableCell> {user.job_title} </TableCell>
          </tr>
        ))
      : null}
  </Table>
)

export default UsersTable
