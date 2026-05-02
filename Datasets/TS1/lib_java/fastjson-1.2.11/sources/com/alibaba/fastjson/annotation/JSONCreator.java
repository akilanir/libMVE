package com.alibaba.fastjson.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.CONSTRUCTOR, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/annotation/JSONCreator.class */
public @interface JSONCreator {
}
