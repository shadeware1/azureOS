#include <iostream>
#include <string>

class MetaData {
public:
    void displayMetadata() {
        std::string azureOSName = "AzureOS";
        std::string version = "1.0.0";
        std::string description = "AzureOS is a highly secure, modded version of Windows 11, focusing on privacy, security, and customization. "
                                  "It comes with hardened security tools like Kali, BlackArch, and a fully riced interface. "
                                  "AzureOS runs from a USB drive, automatically boots on startup, and ensures complete data wiping when the USB is removed.";
        std::string author = "Snoopy";

        std::cout << "========== AzureOS Metadata ==========" << std::endl;
        std::cout << "Name: " << azureOSName << std::endl;
        std::cout << "Version: " << version << std::endl;
        std::cout << "Description: " << std::endl;
        std::cout << description << std::endl;
        std::cout << "Author: " << author << std::endl;
        std::cout << "=====================================" << std::endl;
    }
};

int main() {
    MetaData metadata;
    metadata.displayMetadata();

    return 0;
}
