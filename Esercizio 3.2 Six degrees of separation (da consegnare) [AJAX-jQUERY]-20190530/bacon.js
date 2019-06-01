/* <GABOR,GALAZZO,20024195> --> */
$(document).ready(function () {
    'use strict';

    const INDEX_FIRSTNAME = 1;
    const INDEX_LASTNAME = 2;

    /**
     *
     * A movie instance
     * @typedef {Object} Movie
     * @property {number} year - Movie year
     * @property {string} name - Movie name
     *
     * A server response
     * @typedef {Object} Response
     * @property {number} actorId - ActorId
     * @property {string} firstName - submitted firstName
     * @property {string} lastName - submitted lastName
     * @property {Movie[]} movies - result movie list
     *
     */

    /*globals $:false */
    /*globals Ajax:false */
    /*globals ajaxFailed:false */

    $('#search-all-form').submit(function () {
        new Ajax.Request("/search-all.php",
            {
                method: "get",
                parameters: {
                    firstname: this[INDEX_FIRSTNAME].value,
                    lastname: this[INDEX_LASTNAME].value
                },
                onSuccess: createSearchAllTable,
                onFailure: ajaxFailed,
                onException: ajaxFailed
            }
        );
        return false;
    });

    $('#search-kevin-form').submit(function () {
        new Ajax.Request("/search-kevin.php",
            {
                method: "get",
                parameters: {
                    firstname: this[INDEX_FIRSTNAME].value,
                    lastname: this[INDEX_LASTNAME].value
                },
                onSuccess: createSearchKevinTable,
                onFailure: ajaxFailed,
                onException: ajaxFailed
            }
        );
        return false;
    });

    /**
     * Render search-all response data
     * @param {Ajax.Response} ajax the ajax response
     */
    function createSearchAllTable(ajax) {
        let content = $("#content");
        content.empty();

        let data = JSON.parse(ajax.responseText);

        if (data.actorId == null) {
            content.append(" <h1>Actor <b> "
                + data.firstName + " " + data.lastName
                + " </b> not found</h1>");
        } else {
            content.append(
                " <h1>Results for <b> "
                + data.firstName + " " + data.lastName
                + " </b></h1>");
            createTable(content, data.movies, "All Films");
        }

    }

    /**
     * Render search-kevin response data
     * @param {Ajax.Response} ajax the ajax response
     */
    function createSearchKevinTable(ajax) {
        let content = $("#content");
        content.empty();

        let data = JSON.parse(ajax.responseText);

        if (data.actorId == null) {
            content.append(" <h1>Actor <b> "
                + data.firstName + " " + data.lastName
                + " </b> not found</h1>");
        } else if (data.movies.length === 0) {
            content.append("<h1><b>" + data.firstName + " " + data.lastName
                + "</b> wasn't in any films with Kevin Bacon</h1>");
        } else {
            content.append(" <h1>Results for <b> " + data.firstName + " " + data.lastName
                + " </b> and Kevin Bacon</h1>");
            createTable(content, data.movies, "Films with " + data.firstName + " " + data.lastName
                + " and Kevin Bacon");

        }
    }

    /**
     * Creates a table for movies
     * @param {Element} content the dom element where append the table
     * @param {Movie[]} movies the movie list
     * @param {string} caption the table caption
     */
    function createTable(content, movies, caption) {

        // create table
        let table = $('<table></table>');
        // caption
        table.append('<caption>' + caption + '</caption>')
            .append(' <tr><th>#</th><th>Title</th><th>Year</th></tr>');
        for (let i = 0; i < movies.length; i++) {
            table.append('<tr><td>' + (i + 1)
                + '</td><td>' + (movies[i].name)
                + '</td><td>' + (movies[i].year)
                + '</td></tr>');
        }
        content.append(table);
    }
});
