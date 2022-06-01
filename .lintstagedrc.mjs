export default {
	"*.js": (files) => `yarn run eslint ${files.join(' ')}`,
	"*.?(s)css": (files) => `yarn run stylelint ${files.join(' ')}`,
	"*.{html,erb,md,markdown}": (files) => `yarn run markuplint -f simple --no-color 2>&1 ${files.join(' ')}`
}
