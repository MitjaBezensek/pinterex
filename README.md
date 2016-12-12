# Pinterex

Pinterex is a simple api wrapper for the Pinterest API.

## Documentation

Documentation can be found at [Hexdocs](https://hexdocs.pm/pinterex/api-reference.html).

## Installation and Configuration

1. Add `pinterex` to your list of dependencies in `mix.exs`.
2. Add an [application setting](https://github.com/MitjaBezensek/pinterex/blob/master/lib/api/base.ex#L14) or environment variable `PINTEREST_KEY` for authorization. You can get the key [here](https://developers.pinterest.com/tools/access_token/).

## Usage

Once you have set the access token you can start making calls to the API. 

Pinterex always returns one of the following:
1. `{:ok, result}` where the result is a struct that corresponds to the data returned by Pinterest (ie `Board`, `Pin`, `User`, `Interest` or a paged version of the results).
2. `{:error, message}` where the message is the error message returned by Pinterest.

Here are some example calls:

```
Pinterex.me
```

Like mentioned before, Pinterex returns structs that correspond to the data returned by Pinterest. By default the API returns only a limited subset of the fields, but you can supply a list of fields you would like to get (for a full list of the fields consult the Pinterest API documentation or look at the structs in this project). Here is how you can specify which fields would you like to get:

```
Pinterex.me([fields: ["bio", "counts", "username"]])
```

For request that return multiple items you can limit the number of returned results. The default limit is 25, and the max allowed limit is 100.

```
Pinterex.my_boards([fields: ["name", "counts", "description"], limit: 10])
```

This returns a [`PagedBoards`](https://github.com/MitjaBezensek/pinterex/blob/master/lib/structs/paged_boards.ex) struct which contains the returned `Boards` as well as a link to the next page of the results. You can easily access the next page by using the `next` field in the result. For example, here is how you can get 20 of your boards:

```
{:ok, first_10} = Pinterex.my_boards([fields: ["name", "counts", "description"], limit: 10])
{:ok, second_10} = Pinterex.my_boards([next: first_10.next])
boards = first_10.boards ++ second_20.boards
```

Note that you do not need to specify the fields and limit in the second call. The `next` url already contains the information from the previous call. When the `next` field equals `nil` it means that there are not items left to fetch.

## Influence
  
The design of the API was influence by [ExTwitter](https://github.com/parroty/extwitter).
