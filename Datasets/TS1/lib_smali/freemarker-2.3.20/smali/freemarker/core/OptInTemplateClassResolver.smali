.class public Lfreemarker/core/OptInTemplateClassResolver;
.super Ljava/lang/Object;
.source "OptInTemplateClassResolver.java"

# interfaces
.implements Lfreemarker/core/TemplateClassResolver;


# instance fields
.field private final allowedClasses:Ljava/util/Set;

.field private final trustedTemplateNames:Ljava/util/Set;

.field private final trustedTemplatePrefixes:Ljava/util/List;


# direct methods
.method public constructor <init>(Ljava/util/Set;Ljava/util/List;)V
    .registers 8
    .param p1, "allowedClasses"    # Ljava/util/Set;
    .param p2, "trustedTemplates"    # Ljava/util/List;

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    if-eqz p1, :cond_4d

    .end local p1    # "allowedClasses":Ljava/util/Set;
    :goto_5
    iput-object p1, p0, Lfreemarker/core/OptInTemplateClassResolver;->allowedClasses:Ljava/util/Set;

    .line 52
    if-eqz p2, :cond_56

    .line 53
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    iput-object v2, p0, Lfreemarker/core/OptInTemplateClassResolver;->trustedTemplateNames:Ljava/util/Set;

    .line 54
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lfreemarker/core/OptInTemplateClassResolver;->trustedTemplatePrefixes:Ljava/util/List;

    .line 56
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 57
    .local v0, "it":Ljava/util/Iterator;
    :goto_1b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5e

    .line 58
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 59
    .local v1, "li":Ljava/lang/String;
    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_34

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 60
    :cond_34
    const-string v2, "*"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_50

    .line 61
    iget-object v2, p0, Lfreemarker/core/OptInTemplateClassResolver;->trustedTemplatePrefixes:Ljava/util/List;

    const/4 v3, 0x0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1b

    .line 51
    .end local v0    # "it":Ljava/util/Iterator;
    .end local v1    # "li":Ljava/lang/String;
    .restart local p1    # "allowedClasses":Ljava/util/Set;
    :cond_4d
    sget-object p1, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    goto :goto_5

    .line 63
    .end local p1    # "allowedClasses":Ljava/util/Set;
    .restart local v0    # "it":Ljava/util/Iterator;
    .restart local v1    # "li":Ljava/lang/String;
    :cond_50
    iget-object v2, p0, Lfreemarker/core/OptInTemplateClassResolver;->trustedTemplateNames:Ljava/util/Set;

    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1b

    .line 67
    .end local v0    # "it":Ljava/util/Iterator;
    .end local v1    # "li":Ljava/lang/String;
    :cond_56
    sget-object v2, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    iput-object v2, p0, Lfreemarker/core/OptInTemplateClassResolver;->trustedTemplateNames:Ljava/util/Set;

    .line 68
    sget-object v2, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    iput-object v2, p0, Lfreemarker/core/OptInTemplateClassResolver;->trustedTemplatePrefixes:Ljava/util/List;

    .line 70
    :cond_5e
    return-void
.end method

.method private hasMatchingPrefix(Ljava/lang/String;)Z
    .registers 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 131
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v2, p0, Lfreemarker/core/OptInTemplateClassResolver;->trustedTemplatePrefixes:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_1c

    .line 132
    iget-object v2, p0, Lfreemarker/core/OptInTemplateClassResolver;->trustedTemplatePrefixes:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 133
    .local v1, "prefix":Ljava/lang/String;
    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_19

    const/4 v2, 0x1

    .line 135
    .end local v1    # "prefix":Ljava/lang/String;
    :goto_18
    return v2

    .line 131
    .restart local v1    # "prefix":Ljava/lang/String;
    :cond_19
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 135
    .end local v1    # "prefix":Ljava/lang/String;
    :cond_1c
    const/4 v2, 0x0

    goto :goto_18
.end method


# virtual methods
.method public resolve(Ljava/lang/String;Lfreemarker/core/Environment;Lfreemarker/template/Template;)Ljava/lang/Class;
    .registers 10
    .param p1, "className"    # Ljava/lang/String;
    .param p2, "env"    # Lfreemarker/core/Environment;
    .param p3, "template"    # Lfreemarker/template/Template;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 74
    invoke-virtual {p0, p3}, Lfreemarker/core/OptInTemplateClassResolver;->safeGetTemplateName(Lfreemarker/template/Template;)Ljava/lang/String;

    move-result-object v1

    .line 76
    .local v1, "templateName":Ljava/lang/String;
    if-eqz v1, :cond_1b

    iget-object v2, p0, Lfreemarker/core/OptInTemplateClassResolver;->trustedTemplateNames:Ljava/util/Set;

    invoke-interface {v2, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_14

    invoke-direct {p0, v1}, Lfreemarker/core/OptInTemplateClassResolver;->hasMatchingPrefix(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1b

    .line 79
    :cond_14
    sget-object v2, Lfreemarker/core/TemplateClassResolver;->SAFER_RESOLVER:Lfreemarker/core/TemplateClassResolver;

    invoke-interface {v2, p1, p2, p3}, Lfreemarker/core/TemplateClassResolver;->resolve(Ljava/lang/String;Lfreemarker/core/Environment;Lfreemarker/template/Template;)Ljava/lang/Class;

    move-result-object v2

    .line 89
    :goto_1a
    return-object v2

    .line 81
    :cond_1b
    iget-object v2, p0, Lfreemarker/core/OptInTemplateClassResolver;->allowedClasses:Ljava/util/Set;

    invoke-interface {v2, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_43

    .line 82
    new-instance v2, Lfreemarker/core/_MiscTemplateException;

    const/4 v3, 0x5

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "Instantiating "

    aput-object v5, v3, v4

    const/4 v4, 0x1

    aput-object p1, v3, v4

    const/4 v4, 0x2

    const-string v5, " is not allowed in the template for security reasons. (If you run into this problem when using ?new in a template, you may want to check the \""

    aput-object v5, v3, v4

    const/4 v4, 0x3

    const-string v5, "new_builtin_class_resolver"

    aput-object v5, v3, v4

    const/4 v4, 0x4

    const-string v5, "\" setting in the FreeMarker configuration.)"

    aput-object v5, v3, v4

    invoke-direct {v2, p2, v3}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    throw v2

    .line 89
    :cond_43
    :try_start_43
    invoke-static {p1}, Lfreemarker/template/utility/ClassUtil;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_46
    .catch Ljava/lang/ClassNotFoundException; {:try_start_43 .. :try_end_46} :catch_48

    move-result-object v2

    goto :goto_1a

    .line 90
    :catch_48
    move-exception v0

    .line 91
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    new-instance v2, Lfreemarker/core/_MiscTemplateException;

    invoke-direct {v2, v0, p2}, Lfreemarker/core/_MiscTemplateException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;)V

    throw v2
.end method

.method protected safeGetTemplateName(Lfreemarker/template/Template;)Ljava/lang/String;
    .registers 14
    .param p1, "template"    # Lfreemarker/template/Template;

    .prologue
    const/16 v11, 0x5c

    const/16 v10, 0x2f

    const/4 v6, 0x0

    const/4 v5, -0x1

    const/4 v9, 0x0

    .line 102
    if-nez p1, :cond_b

    move-object v4, v6

    .line 127
    :cond_a
    :goto_a
    return-object v4

    .line 104
    :cond_b
    invoke-virtual {p1}, Lfreemarker/template/Template;->getName()Ljava/lang/String;

    move-result-object v4

    .line 105
    .local v4, "name":Ljava/lang/String;
    if-nez v4, :cond_13

    move-object v4, v6

    goto :goto_a

    .line 108
    :cond_13
    move-object v2, v4

    .line 109
    .local v2, "decodedName":Ljava/lang/String;
    const/16 v7, 0x25

    invoke-virtual {v2, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    if-eq v7, v5, :cond_4c

    .line 110
    const-string v7, "%2e"

    const-string v8, "."

    invoke-static {v2, v7, v8, v9, v9}, Lfreemarker/template/utility/StringUtil;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v2

    .line 111
    const-string v7, "%2E"

    const-string v8, "."

    invoke-static {v2, v7, v8, v9, v9}, Lfreemarker/template/utility/StringUtil;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v2

    .line 112
    const-string v7, "%2f"

    const-string v8, "/"

    invoke-static {v2, v7, v8, v9, v9}, Lfreemarker/template/utility/StringUtil;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v2

    .line 113
    const-string v7, "%2F"

    const-string v8, "/"

    invoke-static {v2, v7, v8, v9, v9}, Lfreemarker/template/utility/StringUtil;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v2

    .line 114
    const-string v7, "%5c"

    const-string v8, "\\"

    invoke-static {v2, v7, v8, v9, v9}, Lfreemarker/template/utility/StringUtil;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v2

    .line 115
    const-string v7, "%5C"

    const-string v8, "\\"

    invoke-static {v2, v7, v8, v9, v9}, Lfreemarker/template/utility/StringUtil;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v2

    .line 117
    :cond_4c
    const-string v7, ".."

    invoke-virtual {v2, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    .line 118
    .local v3, "dotDotIdx":I
    if-eq v3, v5, :cond_7e

    .line 119
    add-int/lit8 v7, v3, -0x1

    if-ltz v7, :cond_7a

    add-int/lit8 v7, v3, -0x1

    invoke-virtual {v2, v7}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 120
    .local v1, "before":I
    :goto_5e
    add-int/lit8 v7, v3, 0x2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v8

    if-ge v7, v8, :cond_7c

    add-int/lit8 v7, v3, 0x2

    invoke-virtual {v2, v7}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 121
    .local v0, "after":I
    :goto_6c
    if-eq v1, v5, :cond_72

    if-eq v1, v10, :cond_72

    if-ne v1, v11, :cond_7e

    :cond_72
    if-eq v0, v5, :cond_78

    if-eq v0, v10, :cond_78

    if-ne v0, v11, :cond_7e

    :cond_78
    move-object v4, v6

    .line 123
    goto :goto_a

    .end local v0    # "after":I
    .end local v1    # "before":I
    :cond_7a
    move v1, v5

    .line 119
    goto :goto_5e

    .restart local v1    # "before":I
    :cond_7c
    move v0, v5

    .line 120
    goto :goto_6c

    .line 127
    .end local v1    # "before":I
    :cond_7e
    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_a

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_a
.end method
