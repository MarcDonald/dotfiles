const { awsUtils } = require('../../../testUtils');
const { MockAWSError } = awsUtils;

let handler;

beforeEach(() => {
    const dependencies = {};
    
    handler = require('../../../../lambdas/${LAMBDA_ROOT}/${LAMBDA_NAME}/handler')(dependencies);
});

afterEach(jest.resetAllMocks);

test('TODO', async () => {
    expect(true).toBeTruthy();
});