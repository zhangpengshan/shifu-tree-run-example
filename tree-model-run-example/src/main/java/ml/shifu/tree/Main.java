/*
 * Copyright [2013-2016] PayPal Software Foundation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package ml.shifu.tree;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import ml.shifu.shifu.core.dtrain.dt.IndependentTreeModel;

/**
 * {@link Main} is an example to call Shifu tree model runner to run Shifu's GBT model or RF model.
 * 
 * <p>
 * Only two jars should be depended: shifu-0.10.0-*.jar and guagua-core-*.jar
 *
 * @author Zhang David (pengzhang@paypal.com)
 */
public class Main {

    /**
     * args[0] if model file of Shifu GBT or Shifu RF
     */
    public static void main(String[] args) throws IOException {
        InputStream inputStream = new BufferedInputStream(new FileInputStream(new File(args[0])));
        IndependentTreeModel treeModel = IndependentTreeModel.loadFromStream(inputStream);
        System.out.println(treeModel.compute(new double[] { 15.85, 23.95, 103.7, 782.7, 0.08401, 0.1002, 0.09938,
                0.05364, 0.1847, 0.05338, 0.4033, 1.078, 2.903, 36.58, 0.009769, 0.03126, 0.05051, 0.01992, 0.02981,
                0.003002, 16.84, 27.66, 112, 876.5, 0.1131, 0.1924, 0.2322, 0.1119, 0.2809, 0.06287 })[0]);
        inputStream.close();
    }

}
