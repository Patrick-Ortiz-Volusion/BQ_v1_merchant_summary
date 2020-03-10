
        CREATE OR REPLACE VIEW `v1-dev-main.v1_merchant_summary.vw_v1_merchant_rolling_prev3Month_GMVSummary` as 

        -- Pto: initialize view for last 3 months
select vOrderDetailid as OrderDetailId, sum(totalprice_usd) as Merchant_Rolling_12_Month_Total_GMV__c, 
sum(paymentReceived_USD) as Merchant_Rolling_12Month_Total_Payment_Received,
sum(paymentAuthorized_USD) as Merchant_Rolling_12Month_Total_Payment_Authorized,
sum(paymentAMount_USD) as Merchant_Rolling_12Month_Total_Payment_Amount,
min(order_month) as first_month, max(order_month) as last_month 
from `v1-dev-main.v1_merchant_summary.vw_v1_merchant_rolling_prev12month_GMVDetail`
where
Order_month >= DATE_TRUNC(DATE_ADD(CURRENT_DATE(), INTERVAL -3 MONTH), MONTH)
and
order_month <=  DATE_TRUNC(DATE_ADD(CURRENT_DATE(), INTERVAL -1 MONTH), MONTH)
group by OrderDetailid




        