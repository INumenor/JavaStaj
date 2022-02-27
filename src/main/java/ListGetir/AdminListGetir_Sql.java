/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ListGetir;

/**
 *
 * @author Batuh
 */
public class AdminListGetir_Sql 
{
        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getUsername() {
            return username;
        }

        public void setUserName(String username) {
            this.username = username;
        }
        public String getPassword() {
            return password;
        }

        public void setPassword(String password) {
            this.password = password;
        }
        private int id;
        private String username;
        private String password;
}
