# 📚 University Materials (Encrypted)

This repository contains university materials and assignment solutions, stored in an encrypted format.

---

> [!IMPORTANT]  
> **⚠️ IMPORTANT WARNING:**
> The files within this repository are **private** and are intended for personal use only. **Their usage in ways that violate the academic integrity policies of your educational institution is solely at your own discretion and responsibility.** 


---

### Accessing Materials

All course materials are stored as individual `.zip` archives, encrypted with a common password. To access them, you will need to decrypt these archives.

**Password for all archives:** `FiitPleaseHelp`

**DO NOT RUN THE DECRYPTION COMMANDS IF YOU DO NOT WISH TO ACCESS THESE MATERIALS.**

#### 📦 To Decrypt (Unpack) All Materials:

Navigate to the root of this repository in your terminal and run the `unpack.sh` script:

```bash
./unpack.sh
```

This command will prompt you for the password (which is `FiitPleaseHelp`) for each `.zip` file and then extract its content into the same directory where the `.zip` file is located.

#### 🔒 To Encrypt (Pack) All Materials:

If you have decrypted files and wish to re-encrypt them (this will delete the original files after successful encryption), use the `pack.sh` script:

```bash
./pack.sh
```

This command will find all unzipped files in the subject directories, pack each one into a new encrypted `.zip` archive, and then delete the original unzipped files.

---

### Repository Structure

Materials are organized by subject, with each individual file encrypted into its own `.zip` archive:
