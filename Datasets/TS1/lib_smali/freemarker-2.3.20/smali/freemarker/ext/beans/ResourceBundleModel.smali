.class public Lfreemarker/ext/beans/ResourceBundleModel;
.super Lfreemarker/ext/beans/BeanModel;
.source "ResourceBundleModel.java"

# interfaces
.implements Lfreemarker/template/TemplateMethodModelEx;


# static fields
.field static final FACTORY:Lfreemarker/ext/util/ModelFactory;


# instance fields
.field private formats:Ljava/util/Hashtable;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 93
    new-instance v0, Lfreemarker/ext/beans/ResourceBundleModel$1;

    invoke-direct {v0}, Lfreemarker/ext/beans/ResourceBundleModel$1;-><init>()V

    sput-object v0, Lfreemarker/ext/beans/ResourceBundleModel;->FACTORY:Lfreemarker/ext/util/ModelFactory;

    return-void
.end method

.method public constructor <init>(Ljava/util/ResourceBundle;Lfreemarker/ext/beans/BeansWrapper;)V
    .registers 4
    .param p1, "bundle"    # Ljava/util/ResourceBundle;
    .param p2, "wrapper"    # Lfreemarker/ext/beans/BeansWrapper;

    .prologue
    .line 106
    invoke-direct {p0, p1, p2}, Lfreemarker/ext/beans/BeanModel;-><init>(Ljava/lang/Object;Lfreemarker/ext/beans/BeansWrapper;)V

    .line 102
    const/4 v0, 0x0

    iput-object v0, p0, Lfreemarker/ext/beans/ResourceBundleModel;->formats:Ljava/util/Hashtable;

    .line 107
    return-void
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 11
    .param p1, "arguments"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 160
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v6

    const/4 v7, 0x1

    if-ge v6, v7, :cond_f

    .line 161
    new-instance v6, Lfreemarker/template/TemplateModelException;

    const-string v7, "No message key was specified"

    invoke-direct {v6, v7}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 163
    :cond_f
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 164
    .local v3, "it":Ljava/util/Iterator;
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lfreemarker/template/TemplateModel;

    invoke-virtual {p0, v6}, Lfreemarker/ext/beans/ResourceBundleModel;->unwrap(Lfreemarker/template/TemplateModel;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 167
    .local v4, "key":Ljava/lang/String;
    :try_start_21
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_34

    .line 169
    iget-object v6, p0, Lfreemarker/ext/beans/ResourceBundleModel;->object:Ljava/lang/Object;

    check-cast v6, Ljava/util/ResourceBundle;

    invoke-virtual {v6, v4}, Ljava/util/ResourceBundle;->getObject(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {p0, v6}, Lfreemarker/ext/beans/ResourceBundleModel;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v6

    .line 179
    :goto_33
    return-object v6

    .line 173
    :cond_34
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v6

    add-int/lit8 v0, v6, -0x1

    .line 174
    .local v0, "args":I
    new-array v5, v0, [Ljava/lang/Object;

    .line 175
    .local v5, "params":[Ljava/lang/Object;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_3d
    if-ge v2, v0, :cond_4e

    .line 176
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lfreemarker/template/TemplateModel;

    invoke-virtual {p0, v6}, Lfreemarker/ext/beans/ResourceBundleModel;->unwrap(Lfreemarker/template/TemplateModel;)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v5, v2

    .line 175
    add-int/lit8 v2, v2, 0x1

    goto :goto_3d

    .line 179
    :cond_4e
    new-instance v6, Lfreemarker/ext/beans/StringModel;

    invoke-virtual {p0, v4, v5}, Lfreemarker/ext/beans/ResourceBundleModel;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lfreemarker/ext/beans/ResourceBundleModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    invoke-direct {v6, v7, v8}, Lfreemarker/ext/beans/StringModel;-><init>(Ljava/lang/Object;Lfreemarker/ext/beans/BeansWrapper;)V
    :try_end_59
    .catch Ljava/util/MissingResourceException; {:try_start_21 .. :try_end_59} :catch_5a
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_59} :catch_74

    goto :goto_33

    .line 181
    .end local v0    # "args":I
    .end local v2    # "i":I
    .end local v5    # "params":[Ljava/lang/Object;
    :catch_5a
    move-exception v1

    .line 183
    .local v1, "e":Ljava/util/MissingResourceException;
    new-instance v6, Lfreemarker/template/TemplateModelException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "No such key: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 185
    .end local v1    # "e":Ljava/util/MissingResourceException;
    :catch_74
    move-exception v1

    .line 187
    .local v1, "e":Ljava/lang/Exception;
    new-instance v6, Lfreemarker/template/TemplateModelException;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method public format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "params"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/MissingResourceException;
        }
    .end annotation

    .prologue
    .line 205
    iget-object v1, p0, Lfreemarker/ext/beans/ResourceBundleModel;->formats:Ljava/util/Hashtable;

    if-nez v1, :cond_b

    .line 206
    new-instance v1, Ljava/util/Hashtable;

    invoke-direct {v1}, Ljava/util/Hashtable;-><init>()V

    iput-object v1, p0, Lfreemarker/ext/beans/ResourceBundleModel;->formats:Ljava/util/Hashtable;

    .line 209
    :cond_b
    const/4 v0, 0x0

    .line 217
    .local v0, "format":Ljava/text/MessageFormat;
    iget-object v1, p0, Lfreemarker/ext/beans/ResourceBundleModel;->formats:Ljava/util/Hashtable;

    invoke-virtual {v1, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "format":Ljava/text/MessageFormat;
    check-cast v0, Ljava/text/MessageFormat;

    .line 218
    .restart local v0    # "format":Ljava/text/MessageFormat;
    if-nez v0, :cond_33

    .line 220
    new-instance v0, Ljava/text/MessageFormat;

    .end local v0    # "format":Ljava/text/MessageFormat;
    iget-object v1, p0, Lfreemarker/ext/beans/ResourceBundleModel;->object:Ljava/lang/Object;

    check-cast v1, Ljava/util/ResourceBundle;

    invoke-virtual {v1, p1}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/text/MessageFormat;-><init>(Ljava/lang/String;)V

    .line 221
    .restart local v0    # "format":Ljava/text/MessageFormat;
    invoke-virtual {p0}, Lfreemarker/ext/beans/ResourceBundleModel;->getBundle()Ljava/util/ResourceBundle;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ResourceBundle;->getLocale()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/MessageFormat;->setLocale(Ljava/util/Locale;)V

    .line 222
    iget-object v1, p0, Lfreemarker/ext/beans/ResourceBundleModel;->formats:Ljava/util/Hashtable;

    invoke-virtual {v1, p1, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 228
    :cond_33
    monitor-enter v0

    .line 230
    :try_start_34
    invoke-virtual {v0, p2}, Ljava/text/MessageFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 231
    :catchall_3a
    move-exception v1

    monitor-exit v0
    :try_end_3c
    .catchall {:try_start_34 .. :try_end_3c} :catchall_3a

    throw v1
.end method

.method public getBundle()Ljava/util/ResourceBundle;
    .registers 2

    .prologue
    .line 236
    iget-object v0, p0, Lfreemarker/ext/beans/ResourceBundleModel;->object:Ljava/lang/Object;

    check-cast v0, Ljava/util/ResourceBundle;

    return-object v0
.end method

.method protected invokeGenericGet(Ljava/util/Map;Ljava/lang/Class;Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 8
    .param p1, "keyMap"    # Ljava/util/Map;
    .param p2, "clazz"    # Ljava/lang/Class;
    .param p3, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 118
    :try_start_0
    iget-object v1, p0, Lfreemarker/ext/beans/ResourceBundleModel;->object:Ljava/lang/Object;

    check-cast v1, Ljava/util/ResourceBundle;

    invoke-virtual {v1, p3}, Ljava/util/ResourceBundle;->getObject(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Lfreemarker/ext/beans/ResourceBundleModel;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;
    :try_end_b
    .catch Ljava/util/MissingResourceException; {:try_start_0 .. :try_end_b} :catch_d

    move-result-object v1

    return-object v1

    .line 120
    :catch_d
    move-exception v0

    .line 122
    .local v0, "e":Ljava/util/MissingResourceException;
    new-instance v1, Lfreemarker/template/TemplateModelException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "No such key: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 131
    iget-object v0, p0, Lfreemarker/ext/beans/ResourceBundleModel;->object:Ljava/lang/Object;

    check-cast v0, Ljava/util/ResourceBundle;

    invoke-virtual {v0}, Ljava/util/ResourceBundle;->getKeys()Ljava/util/Enumeration;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v0

    if-nez v0, :cond_16

    invoke-super {p0}, Lfreemarker/ext/beans/BeanModel;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_16

    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method protected keySet()Ljava/util/Set;
    .registers 4

    .prologue
    .line 142
    invoke-super {p0}, Lfreemarker/ext/beans/BeanModel;->keySet()Ljava/util/Set;

    move-result-object v1

    .line 143
    .local v1, "set":Ljava/util/Set;
    iget-object v2, p0, Lfreemarker/ext/beans/ResourceBundleModel;->object:Ljava/lang/Object;

    check-cast v2, Ljava/util/ResourceBundle;

    invoke-virtual {v2}, Ljava/util/ResourceBundle;->getKeys()Ljava/util/Enumeration;

    move-result-object v0

    .line 144
    .local v0, "e":Ljava/util/Enumeration;
    :goto_c
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_1a

    .line 145
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_c

    .line 147
    :cond_1a
    return-object v1
.end method

.method public size()I
    .registers 2

    .prologue
    .line 137
    invoke-virtual {p0}, Lfreemarker/ext/beans/ResourceBundleModel;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    return v0
.end method
