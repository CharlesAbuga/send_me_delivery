class ConvertSvgIcon {
  final String itemType;

  ConvertSvgIcon({required this.itemType});

  String convertIcon() {
    switch (itemType) {
      case 'Document':
        return 'assets/screenshots/document-1-svgrepo-com (1).svg';
      case 'Electronic':
        return 'assets/screenshots/computer-device-electronics-svgrepo-com.svg';
      case 'Clothes':
        return 'assets/screenshots/clothes-svgrepo-com.svg';
      case 'Documents':
        return 'assets/screenshots/document-1-svgrepo-com (1).svg';
      case 'Cosmetic':
        return 'assets/screenshots/cosmetic-svgrepo-com.svg';
      case 'Household':
        return 'assets/screenshots/chair-furniture-household-interior-sofa-svgrepo-com.svg';

      default:
        return 'assets/screenshots/add-row-svgrepo-com.svg';
    }
  }
}
