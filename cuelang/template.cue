package site

languages: [string]: {
	tag:  string
	name: =~"^\\p{Lu}" // Must start with an uppercase letter
}
