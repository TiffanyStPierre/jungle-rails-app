describe('jungle app add to cart', () => {
  
  it('adds product to cart when add to cart button for first product is clicked on home page', () => {
    cy.visit('http://localhost:3000/')

    cy.get('.btn:not(.disabled)').first().should('be.visible').click();

    cy.get('.cart-icon').should('have.text', '1');
  })
})