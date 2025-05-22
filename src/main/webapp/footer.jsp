<!-- Footer -->
<footer class="footer">
  <div class="footer-column">
    <h3>Threads & Co.</h3>
    <p><strong>📍</strong> Newroad, Kathmandu</p>
    <p><strong>📞</strong> +977-9841965381</p>
    <p><strong>✉️</strong> threadsnco@gmail.com</p>
  </div>
  <div class="footer-column">
    <h4>Quick Links</h4>
    <a href="<%= request.getContextPath() %>/AboutUs.jsp">About Us</a>
    <a href="<%= request.getContextPath() %>/ContactUs.jsp">Contact Us</a>
  </div>
  <div class="footer-column">
    <h4>Our Services</h4>
    <a href="<%= request.getContextPath() %>/PrivacyPolicy.jsp">Privacy Policy</a>
    <a href="<%= request.getContextPath() %>/ExchangeRefund.jsp">Exchange & Refund</a>
    <a href="<%= request.getContextPath() %>/TermsConditions.jsp">Terms & Condition</a>
  </div>
</footer>

<div class="copyright">
  COPYRIGHT © 2025 Threads & Co | All Rights Reserved
</div>

<script>
  const menuToggle = document.getElementById("menu-toggle");
  const menuItems = document.getElementById("menu-items");

  menuToggle.addEventListener("click", (e) => {
    e.preventDefault();
    menuItems.classList.toggle("collapsed");
  });
</script>
</body>
</html>
