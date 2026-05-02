package com.fasterxml.jackson.databind.ser.impl;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.ser.BeanPropertyWriter;
import com.fasterxml.jackson.databind.util.NameTransformer;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/impl/FilteredBeanPropertyWriter.class */
public abstract class FilteredBeanPropertyWriter {
    public static BeanPropertyWriter constructViewBased(BeanPropertyWriter base, Class<?>[] viewsToIncludeIn) {
        if (viewsToIncludeIn.length == 1) {
            return new SingleView(base, viewsToIncludeIn[0]);
        }
        return new MultiView(base, viewsToIncludeIn);
    }

    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/impl/FilteredBeanPropertyWriter$SingleView.class */
    private static final class SingleView extends BeanPropertyWriter {
        protected final BeanPropertyWriter _delegate;
        protected final Class<?> _view;

        protected SingleView(BeanPropertyWriter delegate, Class<?> view) {
            super(delegate);
            this._delegate = delegate;
            this._view = view;
        }

        @Override // com.fasterxml.jackson.databind.ser.BeanPropertyWriter
        public SingleView rename(NameTransformer transformer) {
            return new SingleView(this._delegate.rename(transformer), this._view);
        }

        @Override // com.fasterxml.jackson.databind.ser.BeanPropertyWriter
        public void assignSerializer(JsonSerializer<Object> ser) {
            this._delegate.assignSerializer(ser);
        }

        @Override // com.fasterxml.jackson.databind.ser.BeanPropertyWriter
        public void assignNullSerializer(JsonSerializer<Object> nullSer) {
            this._delegate.assignNullSerializer(nullSer);
        }

        @Override // com.fasterxml.jackson.databind.ser.BeanPropertyWriter, com.fasterxml.jackson.databind.ser.PropertyWriter
        public void serializeAsField(Object bean, JsonGenerator jgen, SerializerProvider prov) throws Exception {
            Class<?> activeView = prov.getActiveView();
            if (activeView == null || this._view.isAssignableFrom(activeView)) {
                this._delegate.serializeAsField(bean, jgen, prov);
            } else {
                this._delegate.serializeAsOmittedField(bean, jgen, prov);
            }
        }

        @Override // com.fasterxml.jackson.databind.ser.BeanPropertyWriter, com.fasterxml.jackson.databind.ser.PropertyWriter
        public void serializeAsElement(Object bean, JsonGenerator jgen, SerializerProvider prov) throws Exception {
            Class<?> activeView = prov.getActiveView();
            if (activeView == null || this._view.isAssignableFrom(activeView)) {
                this._delegate.serializeAsElement(bean, jgen, prov);
            } else {
                this._delegate.serializeAsPlaceholder(bean, jgen, prov);
            }
        }
    }

    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/impl/FilteredBeanPropertyWriter$MultiView.class */
    private static final class MultiView extends BeanPropertyWriter {
        protected final BeanPropertyWriter _delegate;
        protected final Class<?>[] _views;

        protected MultiView(BeanPropertyWriter delegate, Class<?>[] views) {
            super(delegate);
            this._delegate = delegate;
            this._views = views;
        }

        @Override // com.fasterxml.jackson.databind.ser.BeanPropertyWriter
        public MultiView rename(NameTransformer transformer) {
            return new MultiView(this._delegate.rename(transformer), this._views);
        }

        @Override // com.fasterxml.jackson.databind.ser.BeanPropertyWriter
        public void assignSerializer(JsonSerializer<Object> ser) {
            this._delegate.assignSerializer(ser);
        }

        @Override // com.fasterxml.jackson.databind.ser.BeanPropertyWriter
        public void assignNullSerializer(JsonSerializer<Object> nullSer) {
            this._delegate.assignNullSerializer(nullSer);
        }

        @Override // com.fasterxml.jackson.databind.ser.BeanPropertyWriter, com.fasterxml.jackson.databind.ser.PropertyWriter
        public void serializeAsField(Object bean, JsonGenerator jgen, SerializerProvider prov) throws Exception {
            Class<?> activeView = prov.getActiveView();
            if (activeView != null) {
                int i = 0;
                int len = this._views.length;
                while (i < len && !this._views[i].isAssignableFrom(activeView)) {
                    i++;
                }
                if (i == len) {
                    this._delegate.serializeAsOmittedField(bean, jgen, prov);
                    return;
                }
            }
            this._delegate.serializeAsField(bean, jgen, prov);
        }

        @Override // com.fasterxml.jackson.databind.ser.BeanPropertyWriter, com.fasterxml.jackson.databind.ser.PropertyWriter
        public void serializeAsElement(Object bean, JsonGenerator jgen, SerializerProvider prov) throws Exception {
            Class<?> activeView = prov.getActiveView();
            if (activeView != null) {
                int i = 0;
                int len = this._views.length;
                while (i < len && !this._views[i].isAssignableFrom(activeView)) {
                    i++;
                }
                if (i == len) {
                    this._delegate.serializeAsPlaceholder(bean, jgen, prov);
                    return;
                }
            }
            this._delegate.serializeAsElement(bean, jgen, prov);
        }
    }
}
