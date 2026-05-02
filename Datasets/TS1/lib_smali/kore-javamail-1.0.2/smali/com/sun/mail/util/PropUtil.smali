.class public Lcom/sun/mail/util/PropUtil;
.super Ljava/lang/Object;
.source "PropUtil.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    return-void
.end method

.method private static getBoolean(Ljava/lang/Object;Z)Z
    .registers 3
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "def"    # Z

    .prologue
    .line 152
    if-nez p0, :cond_3

    .line 166
    .end local p0    # "value":Ljava/lang/Object;
    .end local p1    # "def":Z
    :cond_2
    :goto_2
    return p1

    .line 154
    .restart local p0    # "value":Ljava/lang/Object;
    .restart local p1    # "def":Z
    :cond_3
    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_21

    .line 159
    if-eqz p1, :cond_18

    .line 160
    check-cast p0, Ljava/lang/String;

    .end local p0    # "value":Ljava/lang/Object;
    const-string v0, "false"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_16

    const/4 v0, 0x1

    :goto_14
    move p1, v0

    goto :goto_2

    :cond_16
    const/4 v0, 0x0

    goto :goto_14

    .line 162
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_18
    check-cast p0, Ljava/lang/String;

    .end local p0    # "value":Ljava/lang/Object;
    const-string v0, "true"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    goto :goto_2

    .line 164
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_21
    instance-of v0, p0, Ljava/lang/Boolean;

    if-eqz v0, :cond_2

    .line 165
    check-cast p0, Ljava/lang/Boolean;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    goto :goto_2
.end method

.method public static getBooleanProperty(Ljava/util/Properties;Ljava/lang/String;Z)Z
    .registers 4
    .param p0, "props"    # Ljava/util/Properties;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "def"    # Z

    .prologue
    .line 71
    invoke-static {p0, p1}, Lcom/sun/mail/util/PropUtil;->getProp(Ljava/util/Properties;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, p2}, Lcom/sun/mail/util/PropUtil;->getBoolean(Ljava/lang/Object;Z)Z

    move-result v0

    return v0
.end method

.method public static getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z
    .registers 4
    .param p0, "session"    # Lkorex/mail/Session;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "def"    # Z

    .prologue
    .line 87
    invoke-virtual {p0}, Lkorex/mail/Session;->getProperties()Ljava/util/Properties;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/sun/mail/util/PropUtil;->getProp(Ljava/util/Properties;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, p2}, Lcom/sun/mail/util/PropUtil;->getBoolean(Ljava/lang/Object;Z)Z

    move-result v0

    return v0
.end method

.method public static getBooleanSystemProperty(Ljava/lang/String;Z)Z
    .registers 5
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "def"    # Z

    .prologue
    .line 95
    :try_start_0
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v2

    invoke-static {v2, p0}, Lcom/sun/mail/util/PropUtil;->getProp(Ljava/util/Properties;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2, p1}, Lcom/sun/mail/util/PropUtil;->getBoolean(Ljava/lang/Object;Z)Z
    :try_end_b
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_b} :catch_d

    move-result p1

    .line 113
    .end local p1    # "def":Z
    :cond_c
    :goto_c
    return p1

    .line 96
    .restart local p1    # "def":Z
    :catch_d
    move-exception v2

    .line 105
    :try_start_e
    invoke-static {p0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 106
    .local v1, "value":Ljava/lang/String;
    if-eqz v1, :cond_c

    .line 108
    if-eqz p1, :cond_23

    .line 109
    const-string v2, "false"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_21

    const/4 v2, 0x1

    :goto_1f
    move p1, v2

    goto :goto_c

    :cond_21
    const/4 v2, 0x0

    goto :goto_1f

    .line 111
    :cond_23
    const-string v2, "true"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    :try_end_28
    .catch Ljava/lang/SecurityException; {:try_start_e .. :try_end_28} :catch_2a

    move-result p1

    goto :goto_c

    .line 112
    .end local v1    # "value":Ljava/lang/String;
    :catch_2a
    move-exception v0

    .line 113
    .local v0, "sex":Ljava/lang/SecurityException;
    goto :goto_c
.end method

.method private static getInt(Ljava/lang/Object;I)I
    .registers 4
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "def"    # I

    .prologue
    .line 135
    if-nez p0, :cond_3

    .line 144
    .end local p0    # "value":Ljava/lang/Object;
    .end local p1    # "def":I
    :cond_2
    :goto_2
    return p1

    .line 137
    .restart local p0    # "value":Ljava/lang/Object;
    .restart local p1    # "def":I
    :cond_3
    instance-of v1, p0, Ljava/lang/String;

    if-eqz v1, :cond_11

    .line 139
    :try_start_7
    move-object v0, p0

    check-cast v0, Ljava/lang/String;

    move-object v1, v0

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_e
    .catch Ljava/lang/NumberFormatException; {:try_start_7 .. :try_end_e} :catch_10

    move-result p1

    goto :goto_2

    .line 140
    :catch_10
    move-exception v1

    .line 142
    :cond_11
    instance-of v1, p0, Ljava/lang/Integer;

    if-eqz v1, :cond_2

    .line 143
    check-cast p0, Ljava/lang/Integer;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p1

    goto :goto_2
.end method

.method public static getIntProperty(Ljava/util/Properties;Ljava/lang/String;I)I
    .registers 4
    .param p0, "props"    # Ljava/util/Properties;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "def"    # I

    .prologue
    .line 63
    invoke-static {p0, p1}, Lcom/sun/mail/util/PropUtil;->getProp(Ljava/util/Properties;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, p2}, Lcom/sun/mail/util/PropUtil;->getInt(Ljava/lang/Object;I)I

    move-result v0

    return v0
.end method

.method public static getIntSessionProperty(Lkorex/mail/Session;Ljava/lang/String;I)I
    .registers 4
    .param p0, "session"    # Lkorex/mail/Session;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "def"    # I

    .prologue
    .line 79
    invoke-virtual {p0}, Lkorex/mail/Session;->getProperties()Ljava/util/Properties;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/sun/mail/util/PropUtil;->getProp(Ljava/util/Properties;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, p2}, Lcom/sun/mail/util/PropUtil;->getInt(Ljava/lang/Object;I)I

    move-result v0

    return v0
.end method

.method private static getProp(Ljava/util/Properties;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p0, "props"    # Ljava/util/Properties;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 123
    invoke-virtual {p0, p1}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 124
    .local v0, "val":Ljava/lang/Object;
    if-eqz v0, :cond_7

    .line 127
    .end local v0    # "val":Ljava/lang/Object;
    :goto_6
    return-object v0

    .restart local v0    # "val":Ljava/lang/Object;
    :cond_7
    invoke-virtual {p0, p1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method
