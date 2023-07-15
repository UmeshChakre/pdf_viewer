

private boolean checkPasswordProtectedPDF(final MethodCall call) {
    try {
        byte[] bytes = call.arguments();
        try {
            PDDocument pdDocument = PDDocument.load(bytes);
            bool encrypted = pdDocument.isEncrypted;
        } catch (InvalidPasswordException ex) {
            result.success(true);
        }
    } catch (Exception ex) {
        result.success(false);
    }
}