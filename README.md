Question 1:
Write an apex trigger that processes Campaign Member records when they are inserted, and
transfers certain information from the Campaign Member to the associated Lead or Contact
record. Assume that both Leads and Contacts have a custom lookup field called Recent
Campaign, with the same API name Recent_Campaign__c. When a Campaign Member is
inserted, the Recent Campaign value on the associated Lead or Contact should be filled in with
the ID of the Campaign that the Campaign Member is associated with. Your code should
include methods that can process both Leads and Contacts dynamically.
**Please also include at least one unit test (this is the only question you need to provide unit
test(s) for).
================================================================================================

Question 2:
When an account is added to an account hierarchy, there is existing automation to fill in the
Ultimate Parent custom lookup field on that account, which is the account at the top of the
account hierarchy (regardless of how many layers down this account is in the hierarchy). For
example, the account Fox Corporation is at the top of a hierarchy and has a direct child (via
the ParentId field), Fox Sports, which itself has a direct child Fox Soccer. Both Fox Sports,
and Fox Soccer have the Ultimate Parent value of Fox Corporation.
Each account also has a currency field called ACV, which is a measure of revenue generated
by that specific account. Each account also has a field called Hierarchy ACV, which outputs
the total aggregated ACV across the whole account hierarchy. When changes are made to an
account hierarchy, Hierarchy ACV must be recalculated on each account.
For example, if Fox Corporation, Fox Sports, and Fox Soccer all have an ACV value of $100,
then each account should also have a Hierarchy ACV value of $300 (the total ACV value across
all accounts in the hierarchy). If the ACV value for Fox Soccer changes to $200, then the
Hierarchy ACV value on each account should be updated to $400. If Fox Soccer were to be
deleted, then Fox Corporation and Fox Sports should be recalculated to have Hierarchy ACV of
$200.
Below is a diagram showing the account fields and how the accounts relate to each other.

Write code that will recalculate the Hierarchy ACV value on each account within a hierarchy
when relevant changes are made. The changes should include:
- Changing the ACV value on any account within the hierarchy
- Adding a new account with ACV to the hierarchy
- Deleting an account in the hierarchy
Example scenarios and results:
1) Change made: Fox Soccer ACV changes to $200; Expected outcome: all accounts
in the hierarchy have Hierarchy ACV of $400
2) Change made: Fox Soccer is deleted from the hierarchy; Expected outcome: all
accounts in the hierarchy have Hierarchy ACV of $200
3) Change made: A new account, Fox Baseball, which has ACV of $1,000 is added
directly under Fox Sports. Expected outcome: all accounts in the hierarchy have
Hierarchy ACV of $1,300
