describe('jungle app home page', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('should increase the count in the cart when the Add To Cart button is clicked', () => {
    cy.contains('Add').click({ force: true });
    cy.contains('My Cart (1)');
  });
});