2^5
stock.prices = c(23,27,23,21,34)
names(stock.prices) = c('Mon', 'Tues', 'Wed', 'Thurs', 'Fri')
stock.prices
mean(stock.prices)
stock.prices > 23
over.23 = stock.prices > 23
stock.prices[over.23]
max(stock.prices)
stock.prices[stock.prices == max(stock.prices)]
