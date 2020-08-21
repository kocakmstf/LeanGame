carthage_bootstrap:
	(carthage bootstrap --platform ios --cache-builds)
	rm -Rf Carthage/Checkouts

carthage_update:
	(carthage update --platform ios --cache-builds)
	rm -Rf Carthage/Checkouts