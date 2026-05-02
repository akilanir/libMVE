.class public Lfreemarker/template/utility/SecurityUtilities;
.super Ljava/lang/Object;
.source "SecurityUtilities.java"


# static fields
.field private static final logger:Lfreemarker/log/Logger;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 66
    const-string v0, "freemarker.security"

    invoke-static {v0}, Lfreemarker/log/Logger;->getLogger(Ljava/lang/String;)Lfreemarker/log/Logger;

    move-result-object v0

    sput-object v0, Lfreemarker/template/utility/SecurityUtilities;->logger:Lfreemarker/log/Logger;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    return-void
.end method

.method public static getSystemProperty(Ljava/lang/String;I)Ljava/lang/Integer;
    .registers 6
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "defValue"    # I

    .prologue
    .line 109
    :try_start_0
    new-instance v1, Lfreemarker/template/utility/SecurityUtilities$3;

    invoke-direct {v1, p0, p1}, Lfreemarker/template/utility/SecurityUtilities$3;-><init>(Ljava/lang/String;I)V

    invoke-static {v1}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;
    :try_end_b
    .catch Ljava/security/AccessControlException; {:try_start_0 .. :try_end_b} :catch_c

    .line 122
    :goto_b
    return-object v1

    .line 118
    :catch_c
    move-exception v0

    .line 120
    .local v0, "e":Ljava/security/AccessControlException;
    sget-object v1, Lfreemarker/template/utility/SecurityUtilities;->logger:Lfreemarker/log/Logger;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Insufficient permissions to read system property "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-static {p0}, Lfreemarker/template/utility/StringUtil;->jQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ", using default value "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lfreemarker/log/Logger;->warn(Ljava/lang/String;)V

    .line 122
    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, p1}, Ljava/lang/Integer;-><init>(I)V

    goto :goto_b
.end method

.method public static getSystemProperty(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 73
    new-instance v0, Lfreemarker/template/utility/SecurityUtilities$1;

    invoke-direct {v0, p0}, Lfreemarker/template/utility/SecurityUtilities$1;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public static getSystemProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "defValue"    # Ljava/lang/String;

    .prologue
    .line 87
    :try_start_0
    new-instance v1, Lfreemarker/template/utility/SecurityUtilities$2;

    invoke-direct {v1, p0, p1}, Lfreemarker/template/utility/SecurityUtilities$2;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v1}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;
    :try_end_b
    .catch Ljava/security/AccessControlException; {:try_start_0 .. :try_end_b} :catch_c

    .line 101
    :goto_b
    return-object v1

    .line 96
    :catch_c
    move-exception v0

    .line 98
    .local v0, "e":Ljava/security/AccessControlException;
    sget-object v1, Lfreemarker/template/utility/SecurityUtilities;->logger:Lfreemarker/log/Logger;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Insufficient permissions to read system property "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-static {p0}, Lfreemarker/template/utility/StringUtil;->jQuoteNoXSS(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ", using default value "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-static {p1}, Lfreemarker/template/utility/StringUtil;->jQuoteNoXSS(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lfreemarker/log/Logger;->warn(Ljava/lang/String;)V

    move-object v1, p1

    .line 101
    goto :goto_b
.end method
