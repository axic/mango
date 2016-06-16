/*
 * Mango Repository Interface
 * Copyright (C) 2016 Alex Beregszaszi
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3 of the License only.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

contract MangoRepoInterface {
    function refCount() constant returns (uint count);
    function refName(uint index) constant returns (string ref);
    function getRef(string ref) constant returns (string hash);
    function setRef(string ref, string hash);
    function deleteRef(string ref);

    function snapshotCount() constant returns (uint count);
    function getSnapshot(uint index) constant returns (string hash);
    function addSnapshot(string hash);
}
