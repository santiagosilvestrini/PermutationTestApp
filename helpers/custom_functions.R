
# convenience function for computing xbin/ybin object given a number of bins
compute_bins <- function(x, n) {
    list(
        start = min(x),
        end = max(x),
        size = (max(x) - min(x)) / n
    )
}