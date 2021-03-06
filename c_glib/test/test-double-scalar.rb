# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

class TestDoubleScalar < Test::Unit::TestCase
  def setup
    @scalar = Arrow::DoubleScalar.new(1.1)
  end

  def test_data_type
    assert_equal(Arrow::DoubleDataType.new,
                 @scalar.data_type)
  end

  def test_valid?
    assert do
      @scalar.valid?
    end
  end

  def test_equal
    options = Arrow::EqualOptions.new
    options.approx = true
    assert do
      @scalar.equal_options(Arrow::DoubleScalar.new(1.1), options)
    end
  end

  def test_to_s
    assert_equal("1.1", @scalar.to_s)
  end

  def test_value
    assert_in_delta(1.1, @scalar.value)
  end
end
