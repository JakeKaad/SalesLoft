import React, { useState } from 'react'
import styled from 'styled-components'
import axios from 'axios'
import UsersTable from './UsersTable'

const fetchUsers = (setUsers) =>
  axios.get('api/people').then((response) => setUsers(response.data))

const Users = () => {
  const [users, setUsers] = useState(null)
  users || fetchUsers(setUsers)

  return <UsersTable users={users} />
}

export default Users
