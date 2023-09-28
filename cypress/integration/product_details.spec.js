describe('jungle app product details', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('should navigate from the home page to the product detail page by clicking on a product', () => {
    cy.get(".products article").first().click();
    cy.url().should("include", "/products/2");
  });
});